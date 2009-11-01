From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Flash sector size
Date: Sun, 1 Nov 2009 01:07:45 -0600
Message-ID: <fa686aa40911010007i3eee7131n46dcc968512a81e7@mail.gmail.com>
References: <4AA900CF.4040304@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4AA900CF.4040304-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 10, 2009 at 7:36 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Hi All,
>
> I have just found if is possible to write to device tree any information about flash sector size.
>
> Just for clearing we use dts/dtb for run-time qemu(cpu emulator) configuration and I would
> like to configure flash and sectors size based on any information from DTS.
>
> Is it any proposed solution?

Sorry for the really late reply.  I'm just cleaning up my mail backlog now.

Yes, there is a binding for describing flash in the device tree.  See
Documentation/powerpc/dts-bindings/mtd-physmap.txt for some details.
NOR is well supported.  NAND drivers use it, but each NAND driver may
require additional properties depending on the NAND controller device
driver.  Flash size can be specified, but I don't think there is a
binding yet for sector size since in most cases the sector size is
probed from the device itself.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
