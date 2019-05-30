From: Boris Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 30 May 2019 11:19:27 -0700
Message-ID: <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com> <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com
Cc: ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On May 30, 2019 3:15:29 AM PDT, Hanna Hawa <hhhawa@amazon=2Ecom> wrote:
>Add support for error detection and correction for Amazon's Annapurna
>Labs SoCs for L1/L2 caches=2E


So this should be a driver for the whole annapurna platform and not only a=
bout the RAS functionality in an IP like the caches=2E See other ARM EDAC d=
rivers in drivers/edac/ for an example=2E

Thx=2E

--=20
Sent from a small device: formatting sux and brevity is inevitable=2E 
