From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/qman: Change fsl,qman-channel-id to
 cell-index
Date: Tue, 5 May 2015 15:45:34 -0500
Message-ID: <1430858734.16357.256.camel@freescale.com>
References: <1429311187-19062-1-git-send-email-scottwood@freescale.com>
	 <BN3PR0301MB126796C0EC18EEBB26702C588CD10@BN3PR0301MB1267.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BN3PR0301MB126796C0EC18EEBB26702C588CD10-CEkquS/Gb80KBjv5qxT+hJwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pledge Roy-R01356 <roy.pledge-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-05-05 at 11:04 -0500, Pledge Roy-R01356 wrote:
> Sorry for the slow reply.
> 
> I don't believe this is correct - let me explain the rational why we had two properties in the QMan portal to begin with.
> 
> The two properties in question are cell-index and fsl,qman-channel-id.
> 
> The cell-index property is used in u-boot as an index for the software portal ID when adding the fsl,liodn from the U-boot table into the device tree.

The device tree is not supposed to contain arbitrary software
identifiers.

> The  fsl,qman-channel-id property is used in Linux and corresponds to a
> hardware value that indicates which channel is dedicated to the
> software portal.
> 
> While I'm not aware of a current SoC where the channel ID for a
> software portal does not match the index (i.e. SWP 0 uses channel 0,
> etc.) 

Thus there's no backward compatibility issue with redefining cell-index
to mean the channel ID.

> it is possible that future SoCs could stray from this model,
> there is no reason for portal index to equal channel ID at all times.

How can future SoCs dictate how we assign a software-defined identifier?
If software wants it to be the same as the channel id, then it will be.

If there is some aspect of the hardware itself (not the documentation)
that cell-index currently corresponds to, other than the channel id,
please make that clear.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
