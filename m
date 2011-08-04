From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] of/address: Add of_iomap_nocache
Date: Thu, 4 Aug 2011 13:53:18 +0100
Message-ID: <CACxGe6tX99gjoCfMrteghmbHHmux3m_8hofORej2tNwnhR3CKQ@mail.gmail.com>
References: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
 <1312454196-31028-1-git-send-email-davidb@codeaurora.org> <20110804.045154.1306142356696424866.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20110804.045154.1306142356696424866.davem@davemloft.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: davidb@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 4, 2011 at 12:51 PM, David Miller <davem@davemloft.net> wro=
te:
> From: David Brown <davidb@codeaurora.org>
> Date: Thu, =A04 Aug 2011 03:36:36 -0700
>
>> Add uncached mappings from devicetree nodes similar to regular io
>> mappings.
>>
>> SPARC is coherent, so there this call is the same as regular of_ioma=
p.
>>
>> Cc: David Miller <davem@davemloft.net>
>> Signed-off-by: David Brown <davidb@codeaurora.org>
>
> Acked-by: David S. Miller <davem@davemloft.net>

Okay, I'll pick it up when I see patches that use it.

g.
