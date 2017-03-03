From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 22/25] dt-bindings: power: Add Owl SPS power domains
Date: Fri, 3 Mar 2017 00:21:17 -0600
Message-ID: <20170303062117.yt3nnkzg75nfkq7e@rob-hp-laptop>
References: <20170228063535.32069-1-afaerber@suse.de>
 <20170228063535.32069-23-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170228063535.32069-23-afaerber@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arm@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 07:35:32AM +0100, Andreas F=E4rber wrote:
> Define power domains for all non-reserved S500 power gates.
> =

> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  v3: new
>  =

>  .../devicetree/bindings/power/actions,owl-sps.txt     | 17 +++++++++++++=
++++
>  include/dt-bindings/power/s500-powergate.h            | 19 +++++++++++++=
++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/actions,owl-s=
ps.txt
>  create mode 100644 include/dt-bindings/power/s500-powergate.h

Acked-by: Rob Herring <robh@kernel.org>
