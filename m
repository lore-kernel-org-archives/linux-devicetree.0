From: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 11 Jun 2019 10:52:16 -0600
Message-ID: <36bca57c999f611353fd9741c55bb2a7@codeaurora.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

> The general plan (and I believe Daniele Palmas was working on it) was
> to eventually make qmi_wwan use rmnet rather than its internal sysfs-
> based implementation. qmi_wwan and ipa are at essentially the same
> level and both could utilize rmnet on top.
> 
> *That's* what I'd like to see. I don't want to see two different ways
> to get QMAP packets to modem firmware from two different drivers that
> really could use the same code.
> 
> Dan

qmi_wwan is based on USB and is very different from the IPA interconnect
though. AFAIK, they do not have much in common (apart from sending &
receiving MAP packets from hardware).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
