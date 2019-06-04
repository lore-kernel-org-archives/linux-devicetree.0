From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 4 Jun 2019 22:04:09 +0200
Message-ID: <CAK8P3a3pQpSpH4q=CL6gr_YzjYgoyD6-eyiLrvnZsqqjpcRxtQ@mail.gmail.com>
References: <20190531035348.7194-1-elder@linaro.org> <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org> <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org> <20190531233306.GB25597@minitux>
 <d76a710d45dd7df3a28afb12fc62cf14@codeaurora.org> <CAK8P3a0brT0zyZGNWiS2R0RMHHFF2JG=_ixQyvjhj3Ky39o0UA@mail.gmail.com>
 <040ce9cc-7173-d10a-a82c-5186d2fcd737@linaro.org> <CAK8P3a2U=RzfpVaAgRP1QwPhRpZiBNsG5qdWjzwG=tCKZefYHA@mail.gmail.com>
 <b26cf34c0d3fa1a7a700cee935244d7a2a7e1388.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b26cf34c0d3fa1a7a700cee935244d7a2a7e1388.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>
Cc: Alex Elder <elder@linaro.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Miller <davem@davemloft.net>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 4, 2019 at 5:18 PM Dan Williams <dcbw@redhat.com> wrote:
> On Tue, 2019-06-04 at 10:13 +0200, Arnd Bergmann wrote:
> >
> > Can you describe what kind of multiplexing is actually going on?
> > I'm still unclear about what we actually use multiple logical
> > interfaces for here, and how they relate to one another.
>
> Each logical interface represents a different "connection" (PDP/EPS
> context) to the provider network with a distinct IP address and QoS.
> VLANs may be a suitable analogy but here they are L3+QoS.
>
> In realistic example the main interface (say rmnet0) would be used for
> web browsing and have best-effort QoS. A second interface (say rmnet1)
> would be used for VOIP and have certain QoS guarantees from both the
> modem and the network itself.
>
> QMAP can also aggregate frames for a given channel (connection/EPS/PDP
> context/rmnet interface/etc) to better support LTE speeds.

Thanks, that's a very helpful explanation!

Is it correct to say then that the concept of having those separate
connections would be required for any proper LTE modem implementation,
but the QMAP protocol (and based on that, the rmnet implementation)
is Qualcomm specific and shared only among several generations of
modems from that one vendor?

You mentioned the need to have a common user space interface
for configuration, and if the above is true, I agree that we should try
to achieve that, either by ensuring rmnet is generic enough to
cover other vendors (and non-QMAP clients), or by creating a
new user level interface that IPA/rmnet can be adapted to.

       Arnd
