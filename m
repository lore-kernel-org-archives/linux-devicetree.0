From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: Add empty of_match_node() macro
Date: Mon, 24 Oct 2011 12:06:05 +0200
Message-ID: <CACxGe6txWcZYvym411Xat0S8UJX=3MWwSLq-GPQn=ERwV00KjA@mail.gmail.com>
References: <1319450012-13033-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1319450012-13033-1-git-send-email-nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2011 at 11:53 AM, Nicolas Ferre <nicolas.ferre@atmel.com> w=
rote:
> Add an empty macro for of_match_node() that will save
> some '#ifdef CONFIG_OF' for non-dt builds.
>
> I have chosen to use a macro instead of a function to
> be able to avoid defining the first parameter.
> In fact, this "struct of_device_id *" first parameter
> is usualy not defined as well on non-dt builds.
>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> =A0include/linux/of.h | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 736b747..92c40a1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -303,6 +303,7 @@ static inline struct device_node *of_parse_phandle(st=
ruct device_node *np,
> =A0}
>
> =A0#define of_match_ptr(_ptr) =A0 =A0 NULL
> +#define of_match_node(_matches, _node) NULL

Where possible, I prefer to code to be written in C, not PP.  :-)
static inline please.

g.
