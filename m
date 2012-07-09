From: Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
Date: Mon, 9 Jul 2012 03:46:59 +0000
Message-ID: <94F013E7935FF44C83EBE7784D62AD3F09354AE6@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1339148585-16947-1-git-send-email-B38951@freescale.com>
 <4FD60FB1.7050106@gmail.com>
 <412C8208B4A0464FA894C5F0C278CD5D01A16829@039-SN1MPN1-002.039d.mgd.msft.net>
 <20120706042611.GA1841@kroah.com>
 <412C8208B4A0464FA894C5F0C278CD5D01A168F2@039-SN1MPN1-002.039d.mgd.msft.net>
 <20120706161718.GA26894@kroah.com>
 <412C8208B4A0464FA894C5F0C278CD5D01A1E694@039-SN1MPN1-002.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <412C8208B4A0464FA894C5F0C278CD5D01A1E694-TcFNo7jSaXPiTqIcKZ1S2K4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
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
To: Jia Hongtao-B38951 <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > I don't understand, why is this just showing up now?  What changed to
> > cause this?  Couldn't that be the real problem here?
> >
> 
> The issue is showing up because we now probe devices twice.
> Previously, we just probe devices once. But now we changed the way of pci
> init which makes pci controllers should be probed earlier than other
> devices.
> So we have to probe pci nodes separately. Probe more than once is the
> root
> cause of this issue.
> 
> The pci patchset I mentioned please refer to:
> http://patchwork.ozlabs.org/patch/163742/

Let me try to clarify a little bit.  The of platform bus normally traverse the device tree to add all the devices.  The change which caused problem is that we need to probe PCIe RC devices at a earlier stage of initialization.  So we added these PCIe RC devices earlier than the normal device tree traversal process.  These PCIe RC devices will be scanned again during the normal traversal and cause duplicated devices being added.  Our proposal is to deal with duplicated devices automatically and make it possible to scan the device tree multiple times for devices to be added. 

Regards,
Leo
