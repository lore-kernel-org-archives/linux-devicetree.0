From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Tue, 25 Oct 2016 10:31:49 -0600
Message-ID: <0cf56793-f0e4-5584-946e-6bb0fbc6a454@airwebreathe.org.uk>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
 <c971d8f4-dbb4-8d6e-f8eb-028a0a95e6fb@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610250913530.14525@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1610250913530.14525@linuxheads99>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Alan

 > Yes!  I have submitted patches for doing exactly that.  About to
 > submit v21.  Here's patch 1 of v20:
 >
 > https://patchwork.kernel.org/patch/9379859/

That's really cool. I hope it gets accepted.




 >> and/or if there were any patches for loading
 >> firmware from userspace - something like this: "cat firmware.bin >
 >> /dev/fpga0"?
 >
 > We discussed doing a char driver interface.  That's where all this
 > started.  It met with lots of resistance.
 >

Yeah I saw some slides about it. Personally I don't care too much about 
the character device thing. It could be something in sysfs - anything 
that allows the user to inject firmware firmware from user-space.


Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
