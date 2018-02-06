From: Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Tue, 6 Feb 2018 20:05:07 +0000
Message-ID: <20180206200507.GA13360@codeaurora.org>
References: <20180118220833.16616-3-ilina@codeaurora.org>
 <20180118222802.18161-1-ilina@codeaurora.org>
 <20180129190852.5ddcgdo3gkc2nw5r@rob-hp-laptop>
 <20180130161750.GA20815@codeaurora.org>
 <20180205221113.GE9465@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180205221113.GE9465@builder>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, msivasub-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05 2018 at 22:11 +0000, Bjorn Andersson wrote:
>On Tue 30 Jan 08:17 PST 2018, Lina Iyer wrote:
>> On Mon, Jan 29 2018 at 19:08 +0000, Rob Herring wrote:
>> > On Thu, Jan 18, 2018 at 03:28:02PM -0700, Lina Iyer wrote:
>[..]
>> > > diff --git a/Documentation/devicetree/bindings/arm/msm/cmd-db.txt b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>[..]
>> > > +Command DB is a database that provides a mapping between resource key and the
>> > > +resource address for a system resource managed by a remote processor. The data
>> > > +is stored in a shared memory region and is loaded by the remote processor.
>> >
>> > Is said shared memory described in DT. If so, this should be a child
>> > node. Only 8 bytes seems kind of fine grained for putting in DT when it
>> > could be implied by the parent shared memory node.
>> >
>> I dont believe this memory will be described in DT for this chipset.
>> Will ask internally.
>>
>
>Well, these things goes two ways...
>
>> > > +
>> > > +Some of the Qualcomm Technologies Inc SoC's have hardware accelerators for
>> > > +controlling shared resources. Depending on the board configuration the shared
>> > > +resource properties may change. These properties are dynamically probed by the
>> > > +remote processor and made available in the shared memory.
>> >
>> > The table may change, but does the presence of it or shared memory
>> > location (of the pointer) change?
>> >
>> The location may change between different SoCs, but will be present in
>> all chipsets of this architecture.
>>
>
>Where is the actual DB located? System RAM or is it some special
>device-memory?
>
It's carved out of system memory and is access protected. Not a device
memory.

-- Lina

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
