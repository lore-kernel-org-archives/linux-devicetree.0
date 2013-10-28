From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Mon, 28 Oct 2013 15:47:44 -0600
Message-ID: <526EDB80.7080406@wwwdotorg.org>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org> <1381869563-16083-10-git-send-email-grant.likely@linaro.org> <20131027134607.E1782C4039D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131027134607.E1782C4039D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/27/2013 07:46 AM, Grant Likely wrote:
> On Tue, 15 Oct 2013 21:39:23 +0100, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> The standard interrupts property in device tree can only handle
>> interrupts coming from a single interrupt parent. If a device is wired
>> to multiple interrupt controllers, then it needs to be attached to a
>> node with an interrupt-map property to demux the interrupt specifiers
>> which is confusing. It would be a lot easier if there was a form of the
>> interrupts property that allows for a separate interrupt phandle for
>> each interrupt specifier.
>>
>> This patch does exactly that by creating a new interrupts-extended
>> property which reuses the phandle+arguments pattern used by GPIOs and
>> other core bindings.
>>
>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Alright, I want to merge this one. I've got an Ack from Tony, general
> agreement from an in person converstaion from Ben (aside from wishing he
> could think of a better property name), and various rumblings of
> approval from anyone I talked to about it at ksummit. I'd like to have
> something more that that to put into the commit text. Please take a look
> and let me know if you agree/disagree with this binding.

The new binding makes sense to me. So, the binding,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

A couple of minor perhaps bikesheddy comments below.

>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

>> +Nodes that describe devices which generate interrupts must contain an either an
>> +"interrupts" property or an "interrupts-extended" property. These properties

"interrupts-ex" would be shorter, although I guess slightly harder to
guess its purpose, unless you're familiar with "ex" in symbol names.

...
>> +A device node may contain either "interrupts" or "interrupts-extended", but not
>> +both. If both properties are present, then the operating system should log an
>> +error

That sounds rather like prescribing SW behaviour, which I thought DT
bindings shouldn't do?

>> and use only the data in "interrupts".

... so perhaps that's better phrased as:

A device node may contain either "interrupts" or "interrupts-extended",
but not both. If both properties are present, the data in "interrupts"
takes precedence.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
