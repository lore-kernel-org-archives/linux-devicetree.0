From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Tue, 19 Dec 2017 15:43:09 +0200
Message-ID: <20171219134308.4plzpknvksbzhio7@valkosipuli.retiisi.org.uk>
References: <20171211013146.2497-1-wenyou.yang@microchip.com>
 <20171211013146.2497-3-wenyou.yang@microchip.com>
 <20171219092246.3usg5mdyi27ivqlq@valkosipuli.retiisi.org.uk>
 <CAOMZO5BHSJv01SwZ2YNtGZTjMtOuOktET43qriK2fQ+jhE2TDA@mail.gmail.com>
 <20171219130537.2viv4wjcp4i3mdkj@valkosipuli.retiisi.org.uk>
 <CAOMZO5C5NJMffBEv2cdqKqUnTMQEYkqzN1JnJMS21PWtKuabnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5C5NJMffBEv2cdqKqUnTMQEYkqzN1JnJMS21PWtKuabnA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@microchip.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel <linux-kernel@vger.kernel.org>, Songjun Wu <songjun.wu@microchip.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philippe Ombredanne <pombredanne@nexb.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 11:19:06AM -0200, Fabio Estevam wrote:
> Hi Sakari,
> 
> On Tue, Dec 19, 2017 at 11:05 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> 
> > I guess it depends on who do you ask and when. Looking at what has been
> > recently merged to media tree master, the latter is preferred.
> 
> Just did 'git grep SPDX drivers/media'
> 
> and it consistently shows // SPDX style for C files.

Both seem to exist. See e.g. c3a3d1d6b8b363a02234e5564692db3647f183e6 .

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
