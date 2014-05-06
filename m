From: Joakim Tjernlund <joakim.tjernlund-SNLAxHN9vbcOP4wsBPIw7w@public.gmane.org>
Subject: Re: [PATCH 5/6] powerpc/corenet: Add DPAA FMan support to the SoC device
 tree(s)
Date: Tue, 6 May 2014 09:40:55 +0200
Message-ID: <OF3FF1D0D1.9BC865BB-ONC1257CD0.0029D93B-C1257CD0.002A330F@transmode.se>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com> <1397823693-27977-5-git-send-email-Shruti@Freescale.com> <1398118442.1694.190.camel__272.432543761347$1398129129$gmane$org@snotra.buserror.net> <53661DAB.10808@Freescale.com> <1399332886.15726.161.camel@snotra.buserror.net> <5368811A.3060609@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5368811A.3060609-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Scott Wood <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Kanetkar Shruti-B44454 <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"Linuxppc-dev" 
<linuxppc-dev-bounces+joakim.tjernlund=transmode.se-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org> 
wrote on 2014/05/06 08:28:42:
> 

.....

> 
> > That said,
> > I don't object to having a way to label a PHY as attached via TBI if
> > that's useful.  I'm giving a mild, non-nacking (given the history)
> > objection to using device_type for that (given other history).
> 
> Personally, I think that TBI PHY support is a bit messy but I don't have
> bandwidth to deal with that. The TBI PHY should be handled as a regular
> PHY and right now is a special case

Yes please! We will use the TBI as the only PHY in 1000BASE-X mode so
naturally we want to see the TBI as its own PHY and monitor its link 
status, AN etc.

 Jocke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
