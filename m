From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts; pxa: add embedded pxa camera capture interface
Date: Mon, 08 Jun 2015 19:23:29 +0200
Message-ID: <877fre3yi6.fsf@belgarion.home>
References: <1433624953-28165-1-git-send-email-robert.jarzmik@free.fr>
	<1433624953-28165-4-git-send-email-robert.jarzmik@free.fr>
	<55736F05.8000904@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55736F05.8000904-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> (Sergei Shtylyov's message
	of "Sun, 07 Jun 2015 01:07:01 +0300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> writes:

>> +		pxa_camera: pxa_camera@50000000 {
>
>    The ePAPR standard has something to say about the node naming:
> "The name of a node should be somewhat generic, reflecting the function of the
> device and not its precise programming model." So I'd suggest "video@50000000"
> instead...
Okay, I understand. As "video" could stand for a video decoder/encoder, or the
display device, I'd rather go for "imaging" or "camera-host", or something like
that if I find an already used named in other dts files.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
