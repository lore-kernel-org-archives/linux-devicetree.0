From: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Tue, 13 Oct 2015 13:13:55 -0700
Message-ID: <561D6603.4060006@cisco.com>
References: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
 <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
 <20151007162755.GA23283@fifo99.com>
 <CAL_JsqJwFeDGJ0cTYwikX7DAvR7SK=CL6Qxyp9oKFWeFMgZNiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJwFeDGJ0cTYwikX7DAvR7SK=CL6Qxyp9oKFWeFMgZNiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, dwalker@fifo99.com
Cc: xe-kernel@external.cisco.com, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/07/2015 02:48 PM, Rob Herring wrote:
> On Wed, Oct 7, 2015 at 11:27 AM,  <dwalker@fifo99.com> wrote:
>> On Tue, Oct 06, 2015 at 12:14:43PM -0500, Rob Herring wrote:
>>> On Tue, Oct 6, 2015 at 10:47 AM, Daniel Walker <danielwa@cisco.com> wrote:
>>>> It looks like there's some seepage of cmdline stuff into
>>>> the generic device tree code. This conflicts with the
>>>> generic cmdline implementation so I remove it in the case
>>>> when that's enabled.
>>> Nice series in general. I've had passing desire to do this every time
>>> I run into the command line code.
>>>
>>> The DT handling of the command line is generic across architectures.
>>> The current design is working around that the kernel command line code
>>> is not that way. I think we can take this a bit further by making the
>>> generic DT code add the command line string directly rather than
>>> relying on the arch to do that. Then we can remove all command line
>>> handling from the arch code. I would also look at whether we can make
>>> boot_command_line static rather than directly accessed. We might have
>>> to leave it public for now, but could treat it as static for generic
>>> cmdline case.
>>>
>> Sorry I didn't respond sooner. I was waiting to see if there were more replies.
>>
>> One of my colleague suggested something similar, I was reluctant to change anything
>> prior to sending it out so I could get more feedback on the direction.
>>
>> So your suggesting this patch be something like,
>>
>> #ifdef CONFIG_GENERIC_CMDLINE
>> // call generic cmdline functions
>> #else
>> // keep what's there currently
>> #endif
> I think so yes, but I'd hope that the else case is empty. You've
> converted the hard arches already. I'd guess the rest using DT would
> be easy to convert as they either don't use DT for command line at all
> or always use it.

So I was thinking about doing a simplification like this,
    932 int __init early_init_dt_scan_chosen(unsigned long node, const 
char *uname,
    933                                      int depth, void *data)
    934 {
    ...
    945
    946         /* Retrieve command line */
    947         p = of_get_flat_dt_prop(node, "bootargs", &l);
    948         /*
    949          * The builtin command line will be added here, or can 
override
    950          * the DT bootargs.
    951          */
    952         cmdline_add_builtin(data, p, COMMAND_LINE_SIZE);

The cmdline code would copy "p" over, or not if it's NULL. Then it would 
either do the builtin command line override, or not. The thing that is 
bothering me is that you have a length check in there "if (p != NULL && 
l > 0)" , is there a situation when "p" is not NULL, but "l" is 0 ?

I could also do this,
cmdline_add_builtin(data, (l > 0) ? p : NULL, COMMAND_LINE_SIZE);

but the strlcpy you have also only copies over "l" bytes, so there would 
have to be a situation when the string is not NULL terminated or someone 
only wants a section of it ?

Daniel
