From: "Wang, Alan 1. (NSB - CN/Hangzhou)" <alan.1.wang@nokia-sbell.com>
Subject: RE: [PATCH] of: dynamic: fix memory leak related to properties of
 __of_node_dup
Date: Mon, 16 Oct 2017 04:35:11 +0000
Message-ID: <VI1PR07MB342111F8ED3EC0697F1B92D8A24F0@VI1PR07MB3421.eurprd07.prod.outlook.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <CAL_JsqK0pc6sL+YR2U-J44fvwKivmxiULD5uc7bzTMEOZ_LKXg@mail.gmail.com>
 <59E1615F.50901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59E1615F.50901@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob and Frank,

Thanks for your comments.
Frank's description is exactly what I meant. I will changed the description=
 as yours if you don't mind.

We are using Linux v3.10.64 and a patch from https://lkml.org/lkml/2014/4/4=
/207.
With this patch all properties are added dynamically to the dynamic nodes. =
This is where I firstly found this issue using kmemleak.

And in our environment, the nodes for OCXO are kept empty in the dts file, =
and the properties will be generated at runtime=20
according to sensor details read from ocxo EEPROM. In this case, I think me=
mory leak remains on latest version when resetting that devices.

Thanks.
Lixin
