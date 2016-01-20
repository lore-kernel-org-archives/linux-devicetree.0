Return-Path: <yankejian@huawei.com>
Subject: Re: [PATCH v2 next-next] net: hns: enet specifies a reference to dsaf
References: <1452654880-28980-1-git-send-email-yankejian@huawei.com>
 <56970F48.9060504@huawei.com> <1452764635.2521.28.camel@linux.intel.com>
From: "Yankejian (Hackim Yim)" <yankejian@huawei.com>
Message-ID: <569F2DEC.9040209@huawei.com>
Date: Wed, 20 Jan 2016 14:49:16 +0800
MIME-Version: 1.0
In-Reply-To: <1452764635.2521.28.camel@linux.intel.com>
Content-Type: multipart/alternative;
	boundary="------------080403090005090006040408"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Yisen Zhuang <Yisen.zhuang@huawei.com>, davem@davemloft.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, huangdaode@hisilicon.com, liguozhu@huawei.com, arnd@arndb.de, fengguang.wu@intel.com, salil.mehta@huawei.com, lisheng011@huawei.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--------------080403090005090006040408
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 2016/1/14 17:43, Andy Shevchenko wrote:
>>  
>>> > > --- a/drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c
>>> > > +++ b/drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c
>>> > > @@ -847,6 +847,7 @@ static struct hnae_ae_ops hns_dsaf_ops = {
>>> > >  int hns_dsaf_ae_init(struct dsaf_device *dsaf_dev)
>>> > >  {
>>> > >  	struct hnae_ae_dev *ae_dev = &dsaf_dev->ae_dev;
>>> > > +	static atomic_t id = ATOMIC_INIT(-1);
>>> > >  
>>> > >  	switch (dsaf_dev->dsaf_ver) {
>>> > >  	case AE_VERSION_1:
>>> > > @@ -858,6 +859,9 @@ int hns_dsaf_ae_init(struct dsaf_device
>>> > > *dsaf_dev)
>>> > >  	default:
>>> > >  		break;
>>> > >  	}
>>> > > +
>>> > > +	snprintf(ae_dev->name, AE_NAME_SIZE, "%s%d",
>>> > > DSAF_DEVICE_NAME,
>>> > > +		 (int)atomic_inc_return(&id));
> If you bind/unbind device enough times you may get an overflow and end
> up with name of existing device (if you have 1+ of them in the system).
>
> To avoid such situation better to use IDA/IDR framework.
>
Hi, Andy
Thanks again for your suggestion.
It seems that using IDA/IDR framework is better, but all of the functions must be serialized by lock.
And actually, we confirm that it won't be overflow in our analysis before we implemented it.

Best Regards,
Kejian Yan




--------------080403090005090006040408
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 2016/1/14 17:43, Andy Shevchenko
      wrote:<br>
    </div>
    <blockquote cite="mid:1452764635.2521.28.camel@linux.intel.com"
      type="cite">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap=""> 
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre wrap=""><span class="moz-txt-citetags">&gt; &gt; </span>--- a/drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c
<span class="moz-txt-citetags">&gt; &gt; </span>+++ b/drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c
<span class="moz-txt-citetags">&gt; &gt; </span>@@ -847,6 +847,7 @@ static struct hnae_ae_ops hns_dsaf_ops = {
<span class="moz-txt-citetags">&gt; &gt; </span> int hns_dsaf_ae_init(struct dsaf_device *dsaf_dev)
<span class="moz-txt-citetags">&gt; &gt; </span> {
<span class="moz-txt-citetags">&gt; &gt; </span> 	struct hnae_ae_dev *ae_dev = &amp;dsaf_dev-&gt;ae_dev;
<span class="moz-txt-citetags">&gt; &gt; </span>+	static atomic_t id = ATOMIC_INIT(-1);
<span class="moz-txt-citetags">&gt; &gt; </span> 
<span class="moz-txt-citetags">&gt; &gt; </span> 	switch (dsaf_dev-&gt;dsaf_ver) {
<span class="moz-txt-citetags">&gt; &gt; </span> 	case AE_VERSION_1:
<span class="moz-txt-citetags">&gt; &gt; </span>@@ -858,6 +859,9 @@ int hns_dsaf_ae_init(struct dsaf_device
<span class="moz-txt-citetags">&gt; &gt; </span>*dsaf_dev)
<span class="moz-txt-citetags">&gt; &gt; </span> 	default:
<span class="moz-txt-citetags">&gt; &gt; </span> 		break;
<span class="moz-txt-citetags">&gt; &gt; </span> 	}
<span class="moz-txt-citetags">&gt; &gt; </span>+
<span class="moz-txt-citetags">&gt; &gt; </span>+	snprintf(ae_dev-&gt;name, AE_NAME_SIZE, "%s%d",
<span class="moz-txt-citetags">&gt; &gt; </span>DSAF_DEVICE_NAME,
<span class="moz-txt-citetags">&gt; &gt; </span>+		 (int)atomic_inc_return(&amp;id));
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">If you bind/unbind device enough times you may get an overflow and end
up with name of existing device (if you have 1+ of them in the system).

To avoid such situation better to use IDA/IDR framework.

</pre>
    </blockquote>
    Hi, Andy<br>
    Thanks again for your suggestion.<br>
    It seems that using IDA/IDR framework is better, but all of the
    functions must be serialized by lock.<br>
    And actually, we confirm that it won't be overflow in our analysis
    before we implemented it.<br>
    <br>
    Best Regards,<br>
    Kejian Yan<br>
    <span style="color: rgb(0, 0, 0); font-family: Simsun; font-size:
      medium; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: 19.2px; orphans:
      auto; text-align: start; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; display: inline !important; float:
      none; background-color: rgb(255, 255, 255);"></span><br>
    <br>
    <br>
  </body>
</html>

--------------080403090005090006040408--
