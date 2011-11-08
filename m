From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Early "find node by alias" function
Date: Tue, 08 Nov 2011 11:57:54 +0000
Message-ID: <1320753474.3259.4.camel@hornet.cambridge.arm.com>
References: <1319210219-10707-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1319210219-10707-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello again,

On Fri, 2011-10-21 at 16:16 +0100, Pawel Moll wrote:
> This patch adds a function for finding a node in flat tree
> based on an alias name. It can be used in early boot code.
> 
> Typical use case is a situation when early code needs data
> from a arbitrary tree node, eg. base address of "serial0" to
> initialise debug output or some sort of ID register to
> probe hardware.
> 
> The tree source could look like that:
> 
> / {
> 	aliases {
> 		serial0 = &uart0;
> 	};
> 
> 	uart0: uart@f0001000 {
> 		reg = <0xf0001000 0x1000>;
> 	};
> }
> 
> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>

Any further comments? Makes sense? Not at all? ;-)

Cheers!

Pawel
