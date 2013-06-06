From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Thu, 6 Jun 2013 22:22:53 +0200
Message-ID: <201306062222.53780.arnd@arndb.de>
References: <51AFA6DD.3000202@wwwdotorg.org>
 <CAOesGMgqxhG45NyCfpHc_0uHS+_Gn-hGZm-+CRvK2EEf1AGTow@mail.gmail.com>
 <20130606172810.GE14209@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130606172810.GE14209@lukather>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "luke.leighton" <luke.leighton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, debian-arm <debian-arm-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux on small ARM machines <arm-netbook-Fj0DB6SUpRXNuVmtMlwsDbVCufUGDwFn@public.gmane.org>, debian-kernel <debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 06 June 2013, Maxime Ripard wrote:
> So yes, Allwinner has an evil vendor tree (c), with a solution similar yet
> inferior (because not generic enough) to the device tree, but they show
> interest on going down the mainline road.

Right, and of course there is nothing special about that, everybody starts
out with they own even vendor tree (c), and as hardware support gets merged
upstream, the diff gets smaller, even though the code in the mainline
kernel is normally very different from what they started out with.

Chances are actually that the Allwinner (A10/A13/A20, not A31) platform may
end up being the first modern one that is fully supported upstream including
a GPU driver, since it is one of the obvious targets for the
reverse-engineering efforts. Ironically (given NVIDIA's reputation), the
Tegra platform is the strongest competitor I see in that race at the moment.

For all I can tell, things are progressing nicely, given that it's currently
a volunteer effort. If anyone needs things to move faster, I'd recommend
them to send money to free-electrons.com.

	Arnd
