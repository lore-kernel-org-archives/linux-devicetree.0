From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Fri, 17 Aug 2012 10:36:25 -0500
Message-ID: <502E64F9.2020400@freescale.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box> <502E3632.70208@freescale.com>
 <502E52F3.7090404@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502E52F3.7090404-qxv4g6HH51o@public.gmane.org>
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
To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Srinivas KANDAGATLA wrote:
> If you know in advance that device on that SOC is broken, then I guess
> "Fail"/"Failed" can be used in status property.
> 
> One user of this flag in kernel device trees is
> ./arch/powerpc/boot/dts/mpc8313erdb.dts

	/* Remove this (or change to "okay") if you have
	 * a REVA3 or later board, if you apply one of the
	 * workarounds listed in section 8.5 of the board
	 * manual, or if you are adapting this device tree
	 * to a different board.
	 */
	status = "fail";

I'm not sure this is the right way to do it.  Normally, the boot loader
should be able to detect the board revision, and it should dynamically set
the 'status'.  We have other devices that fail if a work-around is not
applied, and we don't use this approach.

But assuming that this really is the best approach, then it would make
sense for --strip-disabled to leave this node in the dtb, because
otherwise there would be no way to re-enable it.

-- 
Timur Tabi
Linux kernel developer at Freescale
