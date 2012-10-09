From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of/address: sparse fixes
Date: Mon, 08 Oct 2012 20:56:54 -0500
Message-ID: <50738466.3030002@gmail.com>
References: <20121008194158.bd759eebd0e81de06a03b04b@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121008194158.bd759eebd0e81de06a03b04b-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2012 07:41 PM, Kim Phillips wrote:
> drivers/of/address.c:66:29: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:66:29:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:66:29:    got unsigned int [usertype] *addr
> drivers/of/address.c:87:32: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:87:32:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:87:32:    got unsigned int [usertype] *addr
> drivers/of/address.c:91:30: warning: incorrect type in assignment (different base types)
> drivers/of/address.c:91:30:    expected unsigned int [unsigned] [usertype] <noident>
> drivers/of/address.c:91:30:    got restricted __be32 [usertype] <noident>
> drivers/of/address.c:92:22: warning: incorrect type in assignment (different base types)
> drivers/of/address.c:92:22:    expected unsigned int [unsigned] [usertype] <noident>
> drivers/of/address.c:92:22:    got restricted __be32 [usertype] <noident>
> drivers/of/address.c:147:35: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:147:35:    expected restricted __be32 const [usertype] *addr
> drivers/of/address.c:147:35:    got unsigned int [usertype] *addr
> drivers/of/address.c:157:34: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:157:34:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:157:34:    got unsigned int [usertype] *
> drivers/of/address.c:256:29: warning: restricted __be32 degrades to integer
> drivers/of/address.c:256:36: warning: restricted __be32 degrades to integer
> drivers/of/address.c:262:34: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:262:34:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:262:34:    got unsigned int [usertype] *
> drivers/of/address.c:372:41: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:372:41:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:372:41:    got unsigned int [usertype] *addr
> drivers/of/address.c:395:53: warning: incorrect type in argument 2 (different base types)
> drivers/of/address.c:395:53:    expected restricted __be32 const [usertype] *addr
> drivers/of/address.c:395:53:    got unsigned int [usertype] *addr
> drivers/of/address.c:443:50: warning: incorrect type in argument 2 (different base types)
> drivers/of/address.c:443:50:    expected restricted __be32 const [usertype] *addr
> drivers/of/address.c:443:50:    got unsigned int *<noident>
> drivers/of/address.c:455:49: warning: incorrect type in argument 1 (different base types)
> drivers/of/address.c:455:49:    expected restricted __be32 const [usertype] *cell
> drivers/of/address.c:455:49:    got unsigned int *<noident>
> drivers/of/address.c:480:60: warning: incorrect type in argument 2 (different base types)
> drivers/of/address.c:480:60:    expected restricted __be32 const [usertype] *addr
> drivers/of/address.c:480:60:    got unsigned int *<noident>
> drivers/of/address.c:412:5: warning: symbol '__of_translate_address' was not declared. Should it be static?
> drivers/of/address.c:520:14: error: symbol 'of_get_address' redeclared with different type (originally declared at include/linux/of_address.h:22) - different base types
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

Thanks. Applying all 3 for 3.7.

Rob
