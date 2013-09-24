From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4] media: st-rc: Add ST remote control driver
Date: Tue, 24 Sep 2013 13:49:32 -0600
Message-ID: <5241ECCC.3020808@wwwdotorg.org>
References: <1379581176-25078-1-git-send-email-srinivas.kandagatla@st.com> <5240A740.7000407@wwwdotorg.org> <5241488F.5010000@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5241488F.5010000-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/24/2013 02:08 AM, Srinivas KANDAGATLA wrote:
> Thanks Stephen,
> On 23/09/13 21:40, Stephen Warren wrote:
>> On 09/19/2013 02:59 AM, Srinivas KANDAGATLA wrote:
>>> This patch adds support to ST RC driver, which is basically a IR/UHF
>>> receiver and transmitter. This IP (IRB) is common across all the ST
>>> parts for settop box platforms. IRB is embedded in ST COMMS IP block.
>>> It supports both Rx & Tx functionality.
>>>
>>> In this driver adds only Rx functionality via LIRC codec.
>>
>>> diff --git a/Documentation/devicetree/bindings/media/st-rc.txt b/Documentation/devicetree/bindings/media/st-rc.txt

>>> +	- rx-mode: can be "infrared" or "uhf". rx-mode should be present iff the
>>> +	  rx pins are wired up.
>>> +	- tx-mode: should be "infrared". tx-mode should be present iff the tx
>>> +	  pins are wired up.
>>
>> Should those property names be prefixed with "st,"; I assume they're
>> specific to this binding rather than something generic that applies to
>> all IR controller bindings? If you expect them to be generic, it's fine.
> 
> Officially these bindings are not specified in ePAPR specs

Well, there are plenty of properties we now consider generic that aren't
in ePAPR...

> but I see no reason for not having these properties as generic ones.
>
> Are you ok with that?

I suppose that infrared-vs-uhf is a concept that's probably common
enough across any similar HW device, so it may make sense for these
properties to be generic. If we do intend them to be generic, I'd
suggest they be defined in some generic binding document though; perhaps
something like bindings/media/ir.txt or
bindings/media/remote-control.txt? That way, a HW-specific binding isn't
the only place where a supposedly generic property is defined.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
