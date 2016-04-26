From: okaya@codeaurora.org
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Tue, 26 Apr 2016 08:08:16 -0400
Message-ID: <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160426033029.GB2274@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-04-25 23:30, Vinod Koul wrote:
> On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:
>=20
>> +static int hidma_chan_stats(struct seq_file *s, void *unused)
>> +{
>> +	struct hidma_chan *mchan =3D s->private;
>> +	struct hidma_desc *mdesc;
>> +	struct hidma_dev *dmadev =3D mchan->dmadev;
>> +
>> +	pm_runtime_get_sync(dmadev->ddev.dev);
>=20
> debug shouldn't power up device, why do you want to do that


Clocks are turned off while the hw is idle. I can=E2=80=99t reach hw re=
gisters=20
without restoring power.
