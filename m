From: Tobias Klauser <klto-xXYtEe5Xh1A@public.gmane.org>
Subject: Re: [PATCH v3] Add devicetree support to altera_jtaguart
Date: Mon, 24 Jan 2011 13:28:56 +0100
Message-ID: <20110124132856.3dc1a688@fermion>
References: <4D2E287B.7000005@home.nl>
	<20110112230607.GA31712@angua.secretlab.ca>
	<4D2E52FF.5060102@home.nl> <20110118173557.48407296@fermion>
	<4D3C2A67.6030408@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D3C2A67.6030408-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On Sun, 23 Jan 2011 14:17:27 +0100 Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org> wrote:
> New version of devicetree patch for altera jtag uart.
> Fixed comments in v2 and added version nr as discussed in the altera_ps2 
> patch.

Did you send the patch to linux-serial yet? The driver is in mainline
and changes should flow there as soon as possible too, I think.

While looking at the patch I noticed that we might want to switch the
driver to having one platform device per port (and thus eliminating the
need for the for loop. Anton Vorontsov submitted a patch to do that for
the altera_uart driver a while ago and it was integrated since.

If you are OK with this, I will change the altera_jtaguart driver in
that way too and submit the change (and also Walter's devicetree patch)
to mainline.

Thanks
Tobias
