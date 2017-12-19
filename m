From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v9 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Tue, 19 Dec 2017 12:31:46 -0200
Message-ID: <CAOMZO5DYWA8O5N=CRm2uR3_7qZ4U1M8u8F-oBU8bJfnKXD4DSA@mail.gmail.com>
References: <20171211013146.2497-1-wenyou.yang@microchip.com>
 <20171211013146.2497-3-wenyou.yang@microchip.com> <20171219092246.3usg5mdyi27ivqlq@valkosipuli.retiisi.org.uk>
 <CAOMZO5BHSJv01SwZ2YNtGZTjMtOuOktET43qriK2fQ+jhE2TDA@mail.gmail.com>
 <20171219130537.2viv4wjcp4i3mdkj@valkosipuli.retiisi.org.uk>
 <CAOMZO5C5NJMffBEv2cdqKqUnTMQEYkqzN1JnJMS21PWtKuabnA@mail.gmail.com> <20171219134308.4plzpknvksbzhio7@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171219134308.4plzpknvksbzhio7@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Philippe Ombredanne <pombredanne@nexb.com>, Wenyou Yang <wenyou.yang@microchip.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Songjun Wu <songjun.wu@microchip.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 11:43 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:

> Both seem to exist. See e.g. c3a3d1d6b8b363a02234e5564692db3647f183e6 .

This patch fixes .h files to use /* SPDX style comment, which is the
recommendation.

.c files should use // SPDX style.
