From: Andreas Larson <andreas@gaisler.com>
Subject: Re: [PATCH v5 1/3] gpio: gpio-generic: Add 16 and 32 bit big endian
 byte order support
Date: Wed, 03 Apr 2013 09:49:55 +0200
Message-ID: <515BDF23.9000508@gaisler.com>
References: <1363355140-28216-1-git-send-email-andreas@gaisler.com> <1363355140-28216-2-git-send-email-andreas@gaisler.com> <20130319004012.GA1004@lizard.gateway.2wire.net> <CACRpkdY6D3hvBm13Y41NTbnAav03guB7LEB4RHnRanFXjj_UJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY6D3hvBm13Y41NTbnAav03guB7LEB4RHnRanFXjj_UJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>
Cc: Anton Vorontsov <anton@enomsg.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On 2013-03-27 09:58, Linus Walleij wrote:
> On Tue, Mar 19, 2013 at 1:40 AM, Anton Vorontsov <anton@enomsg.org> wrote:
>> On Fri, Mar 15, 2013 at 02:45:38PM +0100, Andreas Larsson wrote:
>>> There is no general support for 64-bit big endian accesses, so that is
>>> left unsupported.
>>>
>>> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
>>
>> This looks perfect, thanks a lot!
>>
>> Acked-by: Anton Vorontsov <anton@enomsg.org>
>
> Looks good to me as well, but since this was discussed with Grant
> I want his review on this before I merge it.

I take it that you are happy with the other two patches as well?

Grant, any chance of getting this into the 3.10 merge window?

Cheers,
Andreas Larsson
