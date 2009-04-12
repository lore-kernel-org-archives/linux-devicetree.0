From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Sat, 11 Apr 2009 23:58:09 -0600
Message-ID: <fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
References: <1239093559-12043-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <1239093559-12043-1-git-send-email-sr@denx.de>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Stefan Roese <sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 7, 2009 at 2:39 AM, Stefan Roese <sr@denx.de> wrote:
> This patch adds support to handle multiple non-identical chips in one
> flash device tree node. It also adds concat support to physmap_of. This
> makes it possible to support e.g. the Intel P30 48F4400 chips which
> internally consists of 2 non-identical NOR chips on one die. Additionally
> partitions now can span over multiple chips.
>
[...]
> Signed-off-by: Stefan Roese <sr@denx.de>
> CC: Grant Likely <grant.likely@secretlab.ca>

Looks good to me.  To comments below, but neither are enough to hold back m=
y:

Reviewd-by: Grant Likely <grant.likely@secretlab.ca>

However, I have not tested this.  I'd like to hear of some larger
field testing before it is merged.

g.

> + =A0 =A0 =A0 reg_tuple_size =3D (of_n_addr_cells(dp) + of_n_size_cells(d=
p)) * 4;

Ideally s/4/sizeof(u32)/, but not a huge deal.

> + =A0 =A0 =A0 info =3D kzalloc(sizeof(struct of_flash) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct of_flash_list)=
 * count, GFP_KERNEL);
> + =A0 =A0 =A0 if (!info)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out;
> +
> + =A0 =A0 =A0 mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP_K=
ERNEL);

Typically I prefer to see a single kzalloc in a driver which allocates
all the space needed in one go because it simplifies the error/unwind
path.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
