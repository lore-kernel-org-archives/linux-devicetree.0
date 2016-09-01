From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v3 21/22] phy: Add support for Qualcomm's USB HSIC phy
Date: Thu, 01 Sep 2016 15:00:22 -0700
Message-ID: <147276722271.30255.17486402880702436547@sboyd-linaro>
References: <20160901004036.23936-1-stephen.boyd@linaro.org>
 <20160901004036.23936-22-stephen.boyd@linaro.org>
 <CAFp+6iGJo5P3_oFCboKmOno6QzcMhVHhTWVWPFw3fCop0PSa8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFp+6iGJo5P3_oFCboKmOno6QzcMhVHhTWVWPFw3fCop0PSa8g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

(Please trim replies)

Quoting Vivek Gautam (2016-08-31 23:17:55)
> On Thu, Sep 1, 2016 at 6:10 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> > +
> > +       uphy->cal_sleep_clk = clk = devm_clk_get(&ulpi->dev, "cal_sleep");
> > +       if (IS_ERR(clk))
> > +               return PTR_ERR(clk);
> > +
> > +       uphy->phy = devm_phy_create(&ulpi->dev, ulpi->dev.of_node,
> > +                                   &qcom_usb_hsic_phy_ops);
> 
> There's a ulpi_phy library available in  drivers/phy/. Do we want to use that ?
> That also creates a phy-lookup of this PHY so that the ulpi device's parent
> can request the PHY.

I don't have any interest in using those two functions (does two
functions constitute a library?). There's no devm as you say, and it
seems to be specific to the ULPI hardware for dwc3 (the only user) where
the phy is called "usb2-phy". This is a phy for the ChipIdea controller
which only has one phy and it's called "usb-phy" in that case.

> 
> You may want to modify the APIs available in ulpi_phy library to use the
> devm_* APIs.
> 

The lookup isn't necessary because we use DT to find the lookup. I seem
to recall the phy framework requiring a DT lookup too.
