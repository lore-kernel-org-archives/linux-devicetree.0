From: Alex Elder <elder@linaro.org>
Subject: Re: WWAN Controller Framework (was IPA [PATCH v2 00/17])
Date: Mon, 24 Jun 2019 12:06:16 -0500
Message-ID: <6dae9d1c-ceae-7e88-fe61-f4cda82820ea@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <23ff4cce-1fee-98ab-3608-1fd09c2d97f1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <23ff4cce-1fee-98ab-3608-1fd09c2d97f1@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org, Dan Williams <dcbw@redhat.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sorry, I neglected to add Dan and Johannes--who have been
primary contributors in this discussion--to this.  Adding now.

					-Alex

On 6/24/19 11:30 AM, Alex Elder wrote:
> OK I want to try to organize a little more concisely some of the
> discussion on this, because there is a very large amount of volume
> to date and I think we need to try to narrow the focus back down
> again.
> 
> I'm going to use a few terms here.  Some of these I really don't
> like, but I want to be unambiguous *and* (at least for now) I want
> to avoid the very overloaded term "device".
> 
> I have lots more to say, but let's start with a top-level picture,
> to make sure we're all on the same page.
> 
>          WWAN Communication
>          Channel (Physical)
>                  |     ------------------------
> ------------     v     |           :+ Control |  \
> |          |-----------|           :+ Data    |  |
> |    AP    |           | WWAN unit :+ Voice   |   > Functions
> |          |===========|           :+ GPS     |  |
> ------------     ^     |           :+ ...     |  /
>                  |     -------------------------
>           Multiplexed WWAN
>            Communication
>          Channel (Physical)
> 
> - The *AP* is the main CPU complex that's running Linux on one or
>   more CPU cores.
> - A *WWAN unit* is an entity that shares one or more physical
>   *WWAN communication channels* with the AP.
> - A *WWAN communication channel* is a bidirectional means of
>   carrying data between the AP and WWAN unit.
> - A WWAN communication channel carries data using a *WWAN protocol*.
> - A WWAN unit implements one or more *WWAN functions*, such as
>   5G data, LTE voice, GPS, and so on.
> - A WWAN unit shall implement a *WWAN control function*, used to
>   manage the use of other WWAN functions, as well as the WWAN unit
>   itself.
> - The AP communicates with a WWAN function using a WWAN protocol.
> - A WWAN physical channel can be *multiplexed*, in which case it
>   carries the data for one or more *WWAN logical channels*.
> - A multiplexed WWAN communication channel uses a *WWAN wultiplexing
>   protocol*, which is used to separate independent data streams
>   carrying other WWAN protocols.
> - A WWAN logical channel carries a bidirectional stream of WWAN
>   protocol data between an entity on the AP and a WWAN function.
> 
> Does that adequately represent a very high-level picture of what
> we're trying to manage?
> 
> And if I understand it right, the purpose of the generic framework
> being discussed is to define a common mechanism for managing (i.e.,
> discovering, creating, destroying, querying, configuring, enabling,
> disabling, etc.) WWAN units and the functions they implement, along
> with the communication and logical channels used to communicate with
> them.
> 
> Comments?
> 
> 					-Alex
> 
