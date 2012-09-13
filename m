From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3 06/25] docs: Xen ARM DT bindings
Date: Thu, 13 Sep 2012 12:19:06 +0100
Message-ID: <alpine.DEB.2.02.1209131215360.15568@kaball.uk.xensource.com>
References: <alpine.DEB.2.02.1208161618550.4850@kaball.uk.xensource.com>
	<1345131377-14713-6-git-send-email-stefano.stabellini@eu.citrix.com>
	<503BFCD8.5090804@gmail.com>
	<alpine.DEB.2.02.1208281823270.15568@kaball.uk.xensource.com>
	<alpine.DEB.2.02.1209121849200.15568@kaball.uk.xensource.com>
	<50514634.3080303@gmail.com> <20120913102938.GB2470@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20120913102938.GB2470-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org" <xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Tim (Xen.org)" <tim-LM2mM/qkH7s@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Sep 2012, Dave Martin wrote:
> Do you think it's feasible to standardise on some interoperable ABI for
> kvm and Xen?  This sounds pretty optimistic, but I'm not aware of all
> the technicalities, or what possible third-party hypervisors are out
> there.
> 
> If we could do it, it would be good.  But I have my doubts about the
> feasibility and the benefits.  If different hypervisors are significantly
> imcompatible, then having a common low-level ABI doesn't help all that
> much.

It is not really possible because each hypervisor offers a different set
of hypercalls and has a different calling convention, so there is very
little we can do to unify them.

For example many of the current Xen hypercalls are to deal with the grant
table and event channels, that are Xen specific concepts completely
missing in KVM.
