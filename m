From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH V2 2/2] kbuild: dtbs_install: new make target
Date: Tue, 19 Nov 2013 11:40:36 -0700
Message-ID: <528BB0A4.9030501@wwwdotorg.org>
References: <cover.1384798508.git.jason@lakedaemon.net> <eaf050fbd62803784856a4f37d4b332f7778e22c.1384798508.git.jason@lakedaemon.net> <528A65DF.8060000@wwwdotorg.org> <20131118191955.GG10335@titan.lakedaemon.net> <528A6944.3070303@wwwdotorg.org> <20131118192852.GI10335@titan.lakedaemon.net> <528A6CA3.9030904@wwwdotorg.org> <20131118195243.GJ10335@titan.lakedaemon.net> <528A98C8.9040803@wwwdotorg.org> <20131119122801.GL16735@n2100.arm.linux.org.uk> <20131119142336.GA28859@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131119142336.GA28859-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/19/2013 07:23 AM, Jason Cooper wrote:
...
> That's why I prefer to rename the dtbs, it removes the need to parse the
> dtb (fdtget *isn't* currently built/installed by default in dtc)

fdtget is in fact both built and installed by default. At the very least
in the latest dtc source, and it's certainly part of at least the Ubuntu
packages for older versions too, so I assume it's been the default for a
while.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
