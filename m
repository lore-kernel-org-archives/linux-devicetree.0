From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: fix Coresight ETF graph connections
Date: Fri, 25 May 2018 17:46:28 -0500
Message-ID: <20180525224628.GB25153@hector.attlocal.net>
References: <20180508150952.24562-1-robh@kernel.org>
 <20180508150952.24562-3-robh@kernel.org>
 <CAL_JsqL8qBiJUMyUEcih07UoFSAghn6Amfo8OfY-pKU-QX2_mw@mail.gmail.com>
 <20180524044853.713.23166@silver>
 <CANLsYkz9tAH7mazz2LNCtoYsdH4f5bKfGWEnJHsgH0mK6vNMEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkz9tAH7mazz2LNCtoYsdH4f5bKfGWEnJHsgH0mK6vNMEg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Brown <david.brown@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "Ivan T. Ivanov" <iivanov.xz@gmail.com>, "Ivan T . Ivanov" <ivan.ivanov@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 24, 2018 at 10:32:46AM -0600, Mathieu Poirier wrote:

<snip>

> >
> >  Hi Rob,
> >
> >  I no longer have access to this hardware and documentation.
> >  I am sure that Mathieu and friends will take care for verification
> >  of this patch :-)
> 
> The code triggers on the "slave-mode" property rather than the labels,
> so this patch has no effect on how a path is established.  I've tested
> this on a 410c and things look good.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks for verifying this Matthew.  I'll put this in for a fixes as I just sent
out my last set for 4.18.

Regards,

Andy
