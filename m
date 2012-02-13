From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V3 1/1] dt: add of_get_child_count helper function
Date: Sun, 12 Feb 2012 17:04:20 -0700
Message-ID: <CACxGe6tUVR+dWphnswTYcY+kut6V_WTN17ZMR8dFGd0XviyU9Q@mail.gmail.com>
References: <1328980929-5423-1-git-send-email-dong.aisheng@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1328980929-5423-1-git-send-email-dong.aisheng@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dong.aisheng@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Sat, Feb 11, 2012 at 10:22 AM, Dong Aisheng <dong.aisheng@linaro.org=
> wrote:
> Currently most code to get child count in kernel are almost same,
> add a helper to implement this function for dt to use.
>
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
>
> ---
> Hi Rob,
>
> Since my imx pinctrl driver series still depends on the pinctrl core =
dt
> binding patch which is still not in mainline, i'd like this pure dt p=
atch
> go separately first in case others want to use.
>
> changes v2->v3:
> =A0Addressed some people's comments:
> =A0* do not use assignment as expression
> =A0* return 0 for non-dt case
>
> Changes v1->v2:
> =A0* change the name from of_get_child_number to of_get_child_count
> ---
> =A0include/linux/of.h | =A0 16 ++++++++++++++++
> =A01 files changed, 16 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a75a831..ae242ef 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -195,6 +195,17 @@ extern struct device_node *of_get_next_child(con=
st struct device_node *node,
> =A0 =A0 =A0 =A0for (child =3D of_get_next_child(parent, NULL); child =
!=3D NULL; \
> =A0 =A0 =A0 =A0 =A0 =A0 child =3D of_get_next_child(parent, child))
>
> +static inline int of_get_child_count(const struct device_node *np)
> +{
> + =A0 =A0 =A0 struct device_node *child =3D NULL;
> + =A0 =A0 =A0 int num =3D 0;
> +
> + =A0 =A0 =A0 while ((child =3D of_get_next_child(np, child)) !=3D NU=
LL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 num++;

Use for_each_child_of_node()

g.
