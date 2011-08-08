From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: Re: [PATCH 6/9] arch/powerpc/platforms/pseries/iommu.c: add missing
	kfree
Date: Mon, 8 Aug 2011 10:47:10 -0700
Message-ID: <20110808174710.GA3681@us.ibm.com>
References: <1312802283-9107-6-git-send-email-julia@diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <1312802283-9107-6-git-send-email-julia@diku.dk>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Julia Lawall <julia@diku.dk>
Cc: devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Paul Mackerras <paulus@samba.org>, Will Schmidt <will_schmidt@vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 08.08.2011 [13:18:00 +0200], Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> At this point, window has not been stored anywhere, so it has to be freed
> before leaving the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @exists@
> local idexpression x;
> statement S,S1;
> expression E;
> identifier fl;
> expression *ptr != NULL;
> @@
> 
> x = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x == NULL) S
> <... when != x
>      when != if (...) { <+...kfree(x)...+> }
>      when any
>      when != true x == NULL
> x->fl
> ...>
> (
> if (x == NULL) S1
> |
> if (...) { ... when != x
>                when forall
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
> * return ...;
> )
> }
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Nishanth Aravamudan <nacc@us.ibm.com>

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
