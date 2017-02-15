From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Wed, 15 Feb 2017 10:33:31 +0100
Message-ID: <1487151211.2433.21.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1485870854.2932.63.camel@pengutronix.de>
         <a581a944-9bee-e5ce-d7d7-24bf749a38e2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a581a944-9bee-e5ce-d7d7-24bf749a38e2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Tue, 2017-02-14 at 18:27 -0800, Steve Longerbeam wrote:
[...]
> >
> > # Provide an EDID to the HDMI source
> > v4l2-ctl -d /dev/v4l-subdev2 --set-edid=file=edid-1080p.hex
> 
> I can probably generate this Intel hex file myself from sysfs
> edid outputs, but for convenience do you mind sending me this
> file? I have a 1080p HDMI source I can plug into the tc358743.

I copied the EDID off of some random 1080p HDMI monitor,
probably using something like:

    xxd -g1 /sys/class/drm/card0-HDMI-A-1/edid | cut -c 9-56

----------8<----------
 00 ff ff ff ff ff ff 00 09 d1 89 78 45 54 00 00
 2a 14 01 03 80 35 1e 78 2e b8 45 a1 59 55 9f 28
 0d 50 54 a5 6b 80 81 c0 81 00 81 80 a9 c0 b3 00
 d1 c0 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
 45 00 13 2a 21 00 00 1e 00 00 00 ff 00 4e 41 41
 30 36 32 39 36 53 4c 30 0a 20 00 00 00 fd 00 32
 4c 1e 53 11 00 0a 20 20 20 20 20 20 00 00 00 fc
 00 42 65 6e 51 20 47 4c 32 34 34 30 48 0a 01 18
 02 03 22 f1 4f 90 05 04 03 02 01 11 12 13 14 06
 07 15 16 1f 23 09 07 07 65 03 0c 00 10 00 83 01
 00 00 02 3a 80 18 71 38 2d 40 58 2c 45 00 13 2a
 21 00 00 1f 01 1d 80 18 71 1c 16 20 58 2c 25 00
 13 2a 21 00 00 9f 01 1d 00 72 51 d0 1e 20 6e 28
 55 00 13 2a 21 00 00 1e 8c 0a d0 8a 20 e0 2d 10
 10 3e 96 00 13 2a 21 00 00 18 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 eb
---------->8----------

> The other problem here is that my version of v4l2-ctl, built from
> master branch of git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:gjasny/v4l-utils.git, does not
> support taking a subdev node:
> 
> root@mx6q:~# v4l2-ctl -d /dev/v4l-subdev15 --get-edid=format=hex
> VIDIOC_QUERYCAP: failed: Inappropriate ioctl for device
> /dev/v4l-subdev15: not a v4l2 node
> 
> Is this something you added yourself, or where can I find this version
> of v4l2-ctrl?

Ah right, I still have no proper fix for that. v4l-ctl bails out if it
can't VIDIOC_QUERYCAP, which is an ioctl not supported on subdevices.
I have just patched it out locally:

----------8<----------
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 886a91d093ae..fa15a49375ae 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1214,10 +1214,7 @@ int main(int argc, char **argv)
 	}
 
 	verbose = options[OptVerbose];
-	if (doioctl(fd, VIDIOC_QUERYCAP, &vcap)) {
-		fprintf(stderr, "%s: not a v4l2 node\n", device);
-		exit(1);
-	}
+	doioctl(fd, VIDIOC_QUERYCAP, &vcap);
 	capabilities = vcap.capabilities;
 	if (capabilities & V4L2_CAP_DEVICE_CAPS)
 		capabilities = vcap.device_caps;
---------->8----------

Note that setting the EDID is not necessary if you can force the mode on
your HDMI source.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
