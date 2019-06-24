From: Alex Elder <elder@linaro.org>
Subject: Re: WWAN Controller Framework (was IPA [PATCH v2 00/17])
Date: Mon, 24 Jun 2019 16:16:02 -0500
Message-ID: <ad84c95a-1283-c0f5-0fb7-0909d07ee692@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <23ff4cce-1fee-98ab-3608-1fd09c2d97f1@linaro.org>
 <f0fcee096d779837abc46e7badae9105ee8aaecf.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f0fcee096d779837abc46e7badae9105ee8aaecf.camel@redhat.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dan Williams <dcbw@redhat.com>, davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: devicetree@vger.kernel.org, syadagir@codeaurora.org, ejcaruso@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, subashab@codeaurora.org, linux-soc@vger.kernel.org, abhishek.esse@gmail.com, cpratapa@codeaurora.org, benchan@google.com
List-Id: devicetree@vger.kernel.org

On 6/24/19 2:54 PM, Dan Williams wrote:
> On Mon, 2019-06-24 at 11:30 -0500, Alex Elder wrote:
>> OK I want to try to organize a little more concisely some of the
>> discussion on this, because there is a very large amount of volume
>> to date and I think we need to try to narrow the focus back down
>> again.
>>
>> I'm going to use a few terms here.  Some of these I really don't
>> like, but I want to be unambiguous *and* (at least for now) I want
>> to avoid the very overloaded term "device".
>>
>> I have lots more to say, but let's start with a top-level picture,
>> to make sure we're all on the same page.
>>
>>          WWAN Communication
>>          Channel (Physical)
>>                  |     ------------------------
>> ------------     v     |           :+ Control |  \
>>>          |-----------|           :+ Data    |  |
>>>    AP    |           | WWAN unit :+ Voice   |   > Functions
>>>          |===========|           :+ GPS     |  |
>> ------------     ^     |           :+ ...     |  /
>>                  |     -------------------------
>>           Multiplexed WWAN
>>            Communication
>>          Channel (Physical)
>>
>> - The *AP* is the main CPU complex that's running Linux on one or
>>   more CPU cores.
>> - A *WWAN unit* is an entity that shares one or more physical
>>   *WWAN communication channels* with the AP.
> 
> You could just say "WWAN modem" here.

That sounds great to me.

>> - A *WWAN communication channel* is a bidirectional means of
>>   carrying data between the AP and WWAN unit.
>> - A WWAN communication channel carries data using a *WWAN protocol*.
>> - A WWAN unit implements one or more *WWAN functions*, such as
>>   5G data, LTE voice, GPS, and so on.
> 
> Go more generic here. Not just 5G data but any WWAN IP-based data
> (GPRS, EDGE, CDMA, UMTS, EVDO, LTE, 5G, etc). And not just LTE voice
> but any voice data; plenty of devices don't support LTE but still have
> "WWAN logical communication channels"

I really meant *any* sort of function, and was only trying
to give a few examples.  So yes, my meaning was completely
generic, as you suggest.

>> - A WWAN unit shall implement a *WWAN control function*, used to
>>   manage the use of other WWAN functions, as well as the WWAN unit
>>   itself.
>> - The AP communicates with a WWAN function using a WWAN protocol.
>> - A WWAN physical channel can be *multiplexed*, in which case it
>>   carries the data for one or more *WWAN logical channels*.
> 
> It's unclear to me what "physical" means here. USB Interface or
> Endpoint or PCI Function or SMD channel? Or kernel TTY device?

I'm trying to distinguish between (let's say) "hardware" communication
channels (such as what IPA basically provides) and logical ones,
whose data is multiplexed over a "hardware"/"physical" channel.
Maybe "link" would be a better term for what I referred to as a
physical channel, and then have "channels" be multiplexed over a link.
If you have a good suggestion, please offer it.

But I think yes, USB interface, TTY device, etc. are what I mean.
I wanted to capture the fact that there might be more than one of
these (for example a user space QMI link for control, and IPA link
for data?), and that any one of these might also be multiplexed.

Multiplexing is a pretty basic capability of a network link, and I
think the only reason I called it out separately is to be explicit
that it is needs to be supported.

> For example on Qualcomm-based USB dongles a given USB Interface's
> Endpoint represents a QMAP "IP data" channel which itself could be
> multiplexed into separate "IP data" channels.  Or that USB Endpoint(s)
> could be exposed as a TTY which itself can be MUX-ed dynamically using
> GSM 07.10.

Yeah.  In this case the hardware connection between the AP and the
USB dongle would provide a WWAN link (which I think corresponds to
the QMAP "IP data" channel).  And if you wanted to multiplex that
you would use a multiplexing protocol (like QMAP).  And that protocol
would carry one or more logical channels, each using its own WWAN
protocol.  It sounds like GSM 07.10 would be another WWAN multiplexing
protocol.

> To me "physical" usually means the bus type (PCI, USB, SMD, whatever).
> A Linux hardware driver (IPA, qmi_wwan, option, sierra, etc) binds to
> that physical entity using hardware IDs (USB or PCI VID/PID, devicetree
> properties) and exposes some "WWAN logical communication channels".

(Or perhaps exposes the ability to create "WWAN logical channels.")

"Physical" is probably not a good term.  And perhaps focusing
on the transport isn't right--maybe the focus should mainly be on
the WWAN modem entity.  But one of the things we're trying to
address here is that there might be several distinct "physical"
paths through which the AP and modem can communicate, so a driver's
ability to provide such a path should be a sort of first class
abstraction.

I'm really trying to get this discussion to converge a little, to
have a few anchor points to build on.  I hope we're getting there.

> Those logical channels might be multiplexed and another driver (rmnet)
> could handle exposing the de-muxed logical channels that the muxed
> logical channel carries.
> 
>> - A multiplexed WWAN communication channel uses a *WWAN wultiplexing
>>   protocol*, which is used to separate independent data streams
>>   carrying other WWAN protocols.
>> - A WWAN logical channel carries a bidirectional stream of WWAN
>>   protocol data between an entity on the AP and a WWAN function.
> 
> It *usually* is bidirectional. For example some GPS logical
> communication channels just start spitting out NMEA when you give the
> control function a command. The NMEA ports themselves don't accept any
> input.

That's fine...  I don't think there's anything wrong with a
particular application not using both directions.

>> Does that adequately represent a very high-level picture of what
>> we're trying to manage?
> 
> Yes, pretty well. Thanks for trying to specify it all.

I think we're making progress.  I have some more thoughts but I
think I'll wait until tomorrow to share them.

Thanks a lot Dan.  At some point it might be better to have a
conference call to make better progress, but I'm not suggesting
that yet.

					-Alex

>> And if I understand it right, the purpose of the generic framework
>> being discussed is to define a common mechanism for managing (i.e.,
>> discovering, creating, destroying, querying, configuring, enabling,
>> disabling, etc.) WWAN units and the functions they implement, along
>> with the communication and logical channels used to communicate with
>> them.
> 
> Yes.
> 
> Dan
> 
>> Comments?
>>
>> 					-Alex
> 
