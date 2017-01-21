From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] Documentation: devicetree: amlogic: Add R-Box Pro
Date: Sat, 21 Jan 2017 14:02:29 -0600
Message-ID: <20170121200229.b7j3bumq4bd6u5jk@rob-hp-laptop>
References: <20170117030611.23827-2-afaerber@suse.de>
 <20170117225459.4438-1-afaerber@suse.de>
 <20170117225459.4438-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170117225459.4438-2-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, ada@kingnoval.com, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 11:54:58PM +0100, Andreas F=E4rber wrote:
> Cc: ada@kingnoval.com
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  Originally I thought we would group by SoC (6, 8, 8b, gxbb, gxl, gmx, et=
c.)
>  but this got out of order with nexbox,a95x - so inserting kingnovel betw=
een
>  amlogic and nexbox here. If that's what we want going forward, we should=
 move
>  the old entries to make the scheme clearer. The alternative would be to
>  reorder alphabetically within each SoC group, but nexbox,a95x with two S=
oCs
>  makes it difficult to categorize, we could choose gxbb as the earlier on=
e.
>  =

>  Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
