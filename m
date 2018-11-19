From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Use device_type helpers to access the node type
Date: Mon, 19 Nov 2018 19:06:43 +0000
Message-ID: <MWHPR2201MB1277675B043F1E9F2F78479DC1D80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181116221104.23024-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-2-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: James Hogan <jhogan@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>Ralf Baechle <ralf@linux-mips.org>Paul Burton <pburton@wavecomp.com>James Hogan <jhogan@kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

Hello,

Rob Herring wrote:
> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
>=20
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
