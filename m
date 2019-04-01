From: Roy Pledge <roy.pledge@nxp.com>
Subject: of_reserved_mem()/kexec interaction
Date: Mon, 1 Apr 2019 19:09:02 +0000
Message-ID: <DB6PR0402MB2727C7111A5BDBB07F05E29886550@DB6PR0402MB2727.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,=0A=
=0A=
Not sure if you're the right person to address this to but if not=0A=
hopefully someone on the list can assist me.=0A=
=0A=
I'm trying to understand if memory reserved in the device tree via the=0A=
"reserved-memory" facility is preserved during a kexec system call,=0A=
i.e., is the memory at the same location with the contents undisturbed=0A=
when the new kernel starts?=0A=
=0A=
Thanks=0A=
=0A=
Roy=0A=
=0A=
