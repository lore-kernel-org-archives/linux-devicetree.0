From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa
 boards
Date: Thu, 10 Jan 2019 21:57:44 +0800
Message-ID: <20190110135742.GC30487@dragon>
References: <1545144107-88378-1-git-send-email-michal.vokac@ysoft.com>
 <20181228232556.GA14277@bogus>
 <49371bd4-6ab9-31c3-dd48-800becac17e3@ysoft.com>
 <CAL_JsqJyZt=VCv2bX1YYFQt91BcFqDWfeAqkJVcF7eFD0_JM1g@mail.gmail.com>
 <6fd5ac6a-edb5-a600-3c10-b46a1c1d9906@ysoft.com>
 <f96952b2-7b19-5397-00a1-0fe9b5800dab@ysoft.com>
 <CAL_JsqLRX2g1t-8YCqpZ5fd=-MyLPkgy88Gb=6ohEZbxWfS+LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLRX2g1t-8YCqpZ5fd=-MyLPkgy88Gb=6ohEZbxWfS+LA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 08, 2019 at 12:11:50PM -0600, Rob Herring wrote:
> Humm, I thought Shawn had applied to his tree as there were some conflicts.
> 
> Shawn, do you need me to resend?

Sorry.  I was actually dropping the conflicting changes from my tree and
expecting you send the json-schema patch via your tree.  I just applied
your patch to my tree.

@Vokáč,

Please generate your patches against my for-next branch with dt-bindings
being separate patch from dts one.

Shawn
