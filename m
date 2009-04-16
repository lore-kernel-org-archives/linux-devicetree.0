From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Thu, 16 Apr 2009 15:37:58 +0200
Message-ID: <200904161537.59048.sr@denx.de>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40904160626k118cea3cvc0db38a2277e45b8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 16 April 2009, Grant Likely wrote:
> > Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> > Reviewd-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Yup, still looks good to me.  What boards has this been tested on?

I tested this version on PPC405EX Kilauea equipped only one "standard" 
Spansion S29GL512 NOR chip. And a slightly modified version on an MPC8360 
board (kmeter1) which is equipped with the Intel P30 part mentioned in the 
bindings description. Slightly modified since this board support is not yet 
pushed upstream and currently using v2.6.28 (physmap_of.c has received minor 
modifications after 2.6.28 release).

Thanks.

Best regards,
Stefan
