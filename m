From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 1/1] powerpc/512x: dts: remove misplaced IRQ spec from
 'soc' node
Date: Tue, 10 Dec 2013 12:24:16 +0100
Message-ID: <20131210112416.GQ2982@book.gsilab.sittig.org>
References: <1386068212-11484-1-git-send-email-gsi@denx.de>
 <20131203150432.2c326004@crub>
 <20131210100501.GO2982@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131210100501.GO2982-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matteo.facchinetti-rF44gyYGg1k3ahhDiVHSzw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 10, 2013 at 11:05 +0100, Gerhard Sittig wrote:
> 
> FYI: I only noticed yesterday that MPC5125 suffers from the same
> issue, have sent <1386669068-2477-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
> to fix that as well.  Both patches may get squashed when going
> upstream.  Don't have a dump at hand for MPC5125 as I don't have
> access to hardware.

Had a thinko there, the MPC5121 fix already went upstream, while
the MPC5125 fix is pending.  So there is no squashing.  Nevermind.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
