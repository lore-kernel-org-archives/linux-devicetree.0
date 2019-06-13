From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: ti_sci_pm_domains: Add support for
 exclusive and shared access
Date: Thu, 13 Jun 2019 16:22:14 -0600
Message-ID: <CAL_JsqK9c=1YyJ9Gg0BpzD=fzwoZsVToFMyqJEhk6kHPdcprdw@mail.gmail.com>
References: <20190410053728.17374-1-lokeshvutla@ti.com>
 <20190410053728.17374-3-lokeshvutla@ti.com>
 <9fe962b7-0500-6916-1dc3-04db0e11cd4d@ti.com>
 <31dfd9ed-159f-95e7-f5a8-bcf6afec4eaa@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <31dfd9ed-159f-95e7-f5a8-bcf6afec4eaa@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 6:35 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> On 02/05/2019 12:24, Tero Kristo wrote:
> > On 10/04/2019 08:37, Lokesh Vutla wrote:
> >> TISCI protocol supports for enabling the device either with exclusive
> >> permissions for the requesting host or with sharing across the hosts.
> >> There are certain devices which are exclusive to Linux context and
> >> there are certain devices that are shared across different host contexts.
> >> So add support for getting this information from DT by increasing
> >> the power-domain cells to 2.
> >>
> >> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> >
> > Based on some offline discussions with Rob, I am withdrawing my concerns
> > on this patch, thus:
> >
> > Acked-by: Tero Kristo <t-kristo@ti.com>
> >
> > We would still need ack from Rob though.
>
> Rob? Any chance to get ack on this?

Acked-by: Rob Herring <robh@kernel.org>
