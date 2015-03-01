From: vichy <vichy.kuo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: possible add CONFIG define in dts?
Date: Sun, 1 Mar 2015 12:56:41 +0800
Message-ID: <CAOVJa8G8BSeR82gG+MAU5PbzXHTbFOfZJqpNL4sJ7rMP2pjuXQ@mail.gmail.com>
References: <CAOVJa8FmpFFk=3YwgTX4N3u5AKmM05jpbzww4_xNvS3d=W8sRA@mail.gmail.com>
	<20150224110210.GS9714@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150224110210.GS9714@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi Mark:
> The DTB should describe the HW, and thus should be separate from the
> CONFIG options, which control the behaviour of the kernel. So CONFIG_*
> in DTBs doesn't make much sense.
>
> This is broken for a multi-platform kernel, no?
>
> If you want to build DTBs for platforms with slight differences as
> above, place the common portion in a shared dtsi, and override the parts
> which are different in each dts. You'll end up with a dtb for each
> variation, but you don't need to repeat all the common parts in each
> dts.
I found what you mention in the kernel for other disi example.
Sincerely appreciate your kind explanation, ^^
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
