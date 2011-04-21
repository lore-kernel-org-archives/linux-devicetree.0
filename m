From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc: document the FSL MPIC message register
	binding
Date: Thu, 21 Apr 2011 14:35:42 -0500
Message-ID: <20110421143542.68971b33@schlenkerla.am.freescale.net>
References: <1303232375-25014-1-git-send-email-meador_inge@mentor.com>
	<1303232375-25014-2-git-send-email-meador_inge@mentor.com>
	<20110419125214.560f4b99@schlenkerla.am.freescale.net>
	<4DADD3D2.6070805@mentor.com>
	<20110419133336.46d8566f@schlenkerla.am.freescale.net>
	<4DB084F6.4060103@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DB084F6.4060103-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Apr 2011 14:26:46 -0500
Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> Hmmm ...  In the MPC8572E and P1022DS manuals I don't see the terminology
> group used for message registers.

I was looking at the P4080 manual, which does use it.  It looks like some
other chip manuals just use MSGR0-MSGR7.

> If you feel like group is a more idiomatic term, I can change it.

Since the docs aren't consistent, I don't really have a strong opinion
here.  Just make clear in the binding what you're referring to.

-Scott
