From: Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: Document MIPID02 bindings
Date: Mon, 18 Mar 2019 09:08:57 +0000
Message-ID: <a8dff925-3ec4-3a40-f129-ea162ca25aed@st.com>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
 <1552373045-134493-2-git-send-email-mickael.guene@st.com>
 <20190316214649.co63p5arhiwbuv3g@valkosipuli.retiisi.org.uk>
 <b238948a-4b08-4fb8-c955-d071bbcd3d2d@st.com>
 <20190318084825.3hpejk5xg2xt2h4b@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318084825.3hpejk5xg2xt2h4b@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Content-ID: <618E78B5CF9334458B50EFA417AA7D80@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Sakari,

>>>> +
>>>> +Example:
>>>> +
>>>> +mipid02: mipid02@14 {
>>>
>>> The node should be a generic name. "csi2rx" is used by a few devices now.
>>>
>>  If I understand you well, you would prefer:
>> csi2rx: mipid02@14 {
>>  I show no usage of csi2rx node naming except for MIPI-CSI2 RX controller.
> 
> The other way around. :)
> 
> The label can be more or less anything AFAIK.
> 
 Ok got it !!! So something like 'mipid02: bridge@14 {' should be ok ?

Thx
