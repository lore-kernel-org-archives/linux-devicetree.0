From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Mon, 24 Oct 2016 23:05:28 -0600
Message-ID: <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> Hi Joel,
>
> Thanks for submitting your driver!
>
> I didn't see any huge problems, just minor things below...
>
> Alan
>

Hi Alan, Thanks for your feedback. I've implemented all your suggestions 
and I'll resubmit.

I had a question about the status of the fpga-manager framework. Is 
there active work going on? I was wondering if there were any patches 
for specifying a firmware file from device-tree? and/or if there were 
any patches for loading firmware from userspace - something like this: 
"cat firmware.bin > /dev/fpga0"?

Only being able to load firmware from kernel C-code is rather a 
limitation - though I suppose the framework is quite early in development.

Thanks
Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
