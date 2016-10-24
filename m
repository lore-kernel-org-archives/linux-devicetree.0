From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v5 02/23] of: device: Export of_device_{get_modalias,
 uvent_modalias} to modules
Date: Mon, 24 Oct 2016 12:48:24 -0700
Message-ID: <147733850401.29612.2343965740004706258@sboyd-linaro>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018015636.11701-3-stephen.boyd@linaro.org>
 <CAGb2v66t8t3o0PxzaaBKnRvNP=CWG5nYud7Wjp27Q1x2baM4hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v66t8t3o0PxzaaBKnRvNP=CWG5nYud7Wjp27Q1x2baM4hg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb <linux-usb@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Chen-Yu Tsai (2016-10-24 05:19:05)
> Hi,
> 
> On Tue, Oct 18, 2016 at 9:56 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> > The ULPI bus can be built as a module, and it will soon be
> > calling these functions when it supports probing devices from DT.
> > Export them so they can be used by the ULPI module.
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> > Cc: <devicetree@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> > ---
> >  drivers/of/device.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index 8a22a253a830..6719ab35b62e 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -225,6 +225,7 @@ ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
> >
> >         return tsize;
> >  }
> > +EXPORT_SYMBOL_GPL(of_device_get_modalias);
> >
> >  int of_device_request_module(struct device *dev)
> >  {
> > @@ -290,6 +291,7 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> >         }
> >         mutex_unlock(&of_mutex);
> >  }
> > +EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
> 
> This is trailing the wrong function.
> 

Good catch. Must have been some bad rebase.

Peter, can you fix it while applying or should I resend this patch?
