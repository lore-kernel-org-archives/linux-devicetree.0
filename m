From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Wed, 5 Jan 2011 16:09:18 -0600
Message-ID: <20110105160918.2b530fea@udp111988uds.am.freescale.net>
References: <4D12F171.7010103@mentor.com>
	<20101223185623.GA20384@angua.secretlab.ca>
	<4D13C402.2090209@mentor.com>
	<20101223223325.GK20384@angua.secretlab.ca>
	<20110103135120.32aeb60d@udp111988uds.am.freescale.net>
	<4D24E99F.90908@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D24E99F.90908-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 5 Jan 2011 15:58:55 -0600
Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> We need some sort of mapping between a message register and a message 
> register number so that the message registers can be referenced through 
> some sort of API (e.g. 'mpic_msgr_read(0)').  One way to do that would 
> be by putting an order on the registers.  Maybe there is a better way, 
> though ...

A message register is uniquely identified by a reference to the device
tree node, plus a 0-3 index into that node's message registers.

-Scott
