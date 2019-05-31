From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Fri, 31 May 2019 16:27:46 -0700
Message-ID: <20190531232746.GA25597@minitux>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>, David Miller <davem@davemloft.net>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 31 May 12:19 PDT 2019, Arnd Bergmann wrote:

> On Fri, May 31, 2019 at 6:36 PM Alex Elder <elder@linaro.org> wrote:
> > On 5/31/19 9:58 AM, Dan Williams wrote:
> > > On Thu, 2019-05-30 at 22:53 -0500, Alex Elder wrote:
[..]
> > So basically, the purpose of the rmnet driver is to handle QMAP
> > protocol connections, and right now that's what the modem provides.
> 
> Do you have any idea why this particular design was picked?
> 

>From what I've seen of QMAP it seems like a reasonable design choice to
have a software component (rmnet) dealing with this, separate from the
transport. And I think IPA is the 4th or 5th mechanism for transporting
QMAP packets back and forth to the modem.


Downstream rmnet is copyright 2007-, and I know of interest in bringing
at least one of the other transports upstream.

Regards,
Bjorn
