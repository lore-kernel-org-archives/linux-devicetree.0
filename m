From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v6] pstore/ram: Add ramoops support for the Flattened
 Device Tree.
Date: Thu, 4 Apr 2013 21:03:47 -0500
Message-ID: <CAL_JsqK_L9nN6+oxUQzNwFjbFf3+3NroeEwzbMdPS4T6=Mnemg@mail.gmail.com>
References: <1347042576-17675-1-git-send-email-bfreed@chromium.org>
	<20120908052907.GA4724@lizard>
	<20120917062302.GA768@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120917062302.GA768@lizard>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Bryan Freed <bfreed@chromium.org>, Tony Luck <tony.luck@intel.com>, keescook@chromium.org, marco.stornelli@gmail.com, gregkh@linuxfoundation.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, sboyd@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2012 at 1:23 AM, Anton Vorontsov <cbouatmailru@gmail.com> wrote:
> On Fri, Sep 07, 2012 at 10:29:10PM -0700, Anton Vorontsov wrote:
>> On Fri, Sep 07, 2012 at 11:29:36AM -0700, Bryan Freed wrote:
>> > When called with a non-zero of_node, fill out a new ramoops_platform_data
>> > with data from the specified Flattened Device Tree node.
>> > Update ramoops documentation with the new FDT interface.
>> > Update devicetree/binding documentation with pstore/ramoops.txt.
>>
>> Thanks for your work, Bryan! There were a few issues, I fixed
>> them myself but I need your confirmation if you're OK w/ all
>> the changes.
> [...]
>> So, the resulting patch is down below. But I have not pushed
>> it out yet, I'm waiting for your sign off. If you're OK with the
>> changes, please reply with
>> 'Signed-off-by: Bryan Freed <bfreed@chromium.org>'
>
> Bryan, have you had a chance to look into this?

Whatever happened to this? Olof was also looking at doing a binding
back in Jan 2012:

http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg09905.html

Rob
