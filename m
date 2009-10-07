From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Xilinx SYSACE driver and 8-bit attachment
Date: Thu, 8 Oct 2009 09:46:36 +1000
Message-ID: <1d3f23370910071646la1ac12ds7c2805f1569cd9e6@mail.gmail.com>
References: <1d3f23370910070013u6307bc42hf7ab243b52d007df@mail.gmail.com>
	<fa686aa40910070634r4a8dcf74qdcbfb3bde3413109@mail.gmail.com>
	<838c3c32-27d9-4a0a-a197-c7227b911942@VA3EHSMHS014.ehs.local>
	<1d3f23370910071641s75b2d217h71a839b1a0b4013c@mail.gmail.com>
	<7a2a686d-ddf4-4a42-8c73-c933cebf22a4@VA3EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7a2a686d-ddf4-4a42-8c73-c933cebf22a4-+Ck8Kgl/v09Eus+KprP3J7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stephen Neuendorffer <stephenn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi John,


On Thu, Oct 8, 2009 at 9:44 AM, John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> I fixed the device tree generator and checked into git-dev, I'll push it out soon after a little more test time.

I think we should be careful about adding special per-device handing
in the DTS generator.  Where ever possible I would encourage generic
handling.  Most Xilinx devices are "green fields" with respect to the
device tree binding and these params, SystemACE is a little different
because it's been in mainline longer and has users outside the DTS
generator flow.

John
-- 
John Williams, PhD, B.Eng, B.IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663
