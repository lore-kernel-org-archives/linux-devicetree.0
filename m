From: Dan Williams <dcbw@redhat.com>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 19 Jun 2019 20:25:11 -0500
Message-ID: <7c0e8909cee17623565ef88445b0497d5504fe1c.camel@redhat.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org>
 <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
 <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
 <613cdfde488eb23d7207c7ba6258662702d04840.camel@sipsolutions.net>
 <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com>
 <6c70950d0c78bc02a3d016918ec3929e@codeaurora.org>
 <CAK8P3a3e+U85yHTeE4dHa4okLVHgBd8Kke9=FytzvMwz+wB0sQ@mail.gmail.com>
 <2926e45fd7ff62fd7c4af9b338bf0caa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2926e45fd7ff62fd7c4af9b338bf0caa@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, syadagir@codeaurora.org, Eric Caruso <ejcaruso@google.com>, David Miller <davem@davemloft.net>, linux-arm-msm@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Networking <netdev@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alex Elder <elder@linaro.org>, Johannes Berg <johannes@sipsolutions.net>, linux-soc@vger.kernel.org, abhishek.esse@gmail.com, cpratapa@codeaurora.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-19 at 12:47 -0600, Subash Abhinov Kasiviswanathan
wrote:
> > > There is a n:1 relationship between rmnet and IPA.
> > > rmnet does the de-muxing to multiple netdevs based on the mux id
> > > in the MAP header for RX packets and vice versa.
> > 
> > Oh, so you mean that even though IPA supports multiple channels
> > and multiple netdev instances for a physical device, all the
> > rmnet devices end up being thrown into a single channel in IPA?
> > 
> > What are the other channels for in IPA? I understand that there
> > is one channel for commands that is separate, while the others
> > are for network devices, but that seems to make no sense if
> > we only use a single channel for rmnet data.
> > 
> 
> AFAIK, the other channels are for use cases like tethering.
> There is only a single channel which is used for RX
> data which is then de-muxed using rmnet.

That seems odd, since tethering is no different than any other data
channel in QMI, just that it may have a different APN and QoS
guarantees.

Dan
