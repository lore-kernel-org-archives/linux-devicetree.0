From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Early "find node by alias" function
Date: Fri, 21 Oct 2011 09:45:29 -0700
Message-ID: <4EA1A1A9.2090403@cavium.com>
References: <1319210219-10707-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/21/2011 08:16 AM, Pawel Moll wrote:
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
> 		serial0 =&uart0;
> 	};
>
> 	uart0: uart@f0001000 {
> 		reg =<0xf0001000 0x1000>;
> 	};
> }
>
> Signed-off-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>

How is this patch different/better than:


http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-June/005819.html

David Daney
