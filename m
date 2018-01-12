Return-Path: <SRS0=lT+O=EH=rock-chips.com=zhengsq@kernel.org>
Reply-To: zhengsq@rock-chips.com
Subject: Re: [PATCH v2 3/4] media: ov2685: add support for OV2685 sensor
References: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
 <1514534905-21393-3-git-send-email-zhengsq@rock-chips.com>
 <20180103114324.za6bmg2rxuygawi4@valkosipuli.retiisi.org.uk>
From: Shunqian Zheng <zhengsq@rock-chips.com>
Message-ID: <8f60a7f8-8471-85e8-70d3-520701edc092@rock-chips.com>
Date: Fri, 12 Jan 2018 10:30:57 +0800
MIME-Version: 1.0
In-Reply-To: <20180103114324.za6bmg2rxuygawi4@valkosipuli.retiisi.org.uk>
Content-Type: multipart/alternative;
 boundary="------------8B0D3626B05EE637EE2CE4A6"
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, ddl@rock-chips.com, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------8B0D3626B05EE637EE2CE4A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,


On 2018年01月03日 19:43, Sakari Ailus wrote:
>> +static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
>> +{
>> +	struct ov2685 *ov2685 = to_ov2685(sd);
>> +	struct i2c_client *client = ov2685->client;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&ov2685->mutex);
>> +
>> +	on = !!on;
>> +	if (on == ov2685->streaming)
>> +		goto unlock_and_return;
>> +
>> +	if (on) {
>> +		/* In case these controls are set before streaming */
>> +		ov2685_set_exposure(ov2685, ov2685->exposure->val);
>> +		ov2685_set_gain(ov2685, ov2685->anal_gain->val);
>> +		ov2685_set_vts(ov2685, ov2685->vblank->val);
>> +		ov2685_enable_test_pattern(ov2685, ov2685->test_pattern->val);
> You should use __v4l2_ctrl_handler_setup() here. Or put that to the
> driver's runtime_resume function. That actually might be better.
The v3 put __v4l2_ctrl_handler_setup() to the runtime_resume callback. But
ov2685_s_stream()
    -> pm_runtime_get_sync()
        -> ov2685_runtime_resume()
             -> __v4l2_ctrl_handler_setup()
                 -> pm_runtime_get_if_in_use(), always <= 0 because 
dev->power.runtime_status != RPM_ACTIVE.

Seems like  __v4l2_ctrl_handler_setup() has to be in ov2685_s_stream().

Thanks
>> +
>> +		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
>> +				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STREAMING);
>> +		if (ret)
>> +			goto unlock_and_return;
>> +	} else {
>> +		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
>> +				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STANDBY);
>> +		if (ret)
>> +			goto unlock_and_return;
>> +	}
>> +
>> +	ov2685->streaming = on;
>> +
>> +unlock_and_return:
>> +	mutex_unlock(&ov2685->mutex);
>> +	return ret;
>> +}


--------------8B0D3626B05EE637EE2CE4A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Sakari,</p>
    <br>
    <div class="moz-cite-prefix">On 2018年01月03日 19:43, Sakari Ailus
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180103114324.za6bmg2rxuygawi4@valkosipuli.retiisi.org.uk">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">+static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct ov2685 *ov2685 = to_ov2685(sd);
+	struct i2c_client *client = ov2685-&gt;client;
+	int ret = 0;
+
+	mutex_lock(&amp;ov2685-&gt;mutex);
+
+	on = !!on;
+	if (on == ov2685-&gt;streaming)
+		goto unlock_and_return;
+
+	if (on) {
+		/* In case these controls are set before streaming */
+		ov2685_set_exposure(ov2685, ov2685-&gt;exposure-&gt;val);
+		ov2685_set_gain(ov2685, ov2685-&gt;anal_gain-&gt;val);
+		ov2685_set_vts(ov2685, ov2685-&gt;vblank-&gt;val);
+		ov2685_enable_test_pattern(ov2685, ov2685-&gt;test_pattern-&gt;val);
</pre>
      </blockquote>
      <pre wrap="">You should use __v4l2_ctrl_handler_setup() here. Or put that to the
driver's runtime_resume function. That actually might be better.
</pre>
    </blockquote>
    The v3 put __v4l2_ctrl_handler_setup() to the runtime_resume
    callback. But <br>
    ov2685_s_stream()<br>
       -&gt; pm_runtime_get_sync()<br>
           -&gt; ov2685_runtime_resume()<br>
                -&gt; __v4l2_ctrl_handler_setup()<br>
                    -&gt; pm_runtime_get_if_in_use(), always &lt;= 0
    because dev-&gt;power.runtime_status != RPM_ACTIVE.<br>
    <br>
    Seems like  __v4l2_ctrl_handler_setup() has to be in
    ov2685_s_stream().<br>
    <br>
    Thanks<br>
    <blockquote type="cite"
      cite="mid:20180103114324.za6bmg2rxuygawi4@valkosipuli.retiisi.org.uk">
      <pre wrap="">
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">+
+		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
+				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STREAMING);
+		if (ret)
+			goto unlock_and_return;
+	} else {
+		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
+				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STANDBY);
+		if (ret)
+			goto unlock_and_return;
+	}
+
+	ov2685-&gt;streaming = on;
+
+unlock_and_return:
+	mutex_unlock(&amp;ov2685-&gt;mutex);
+	return ret;
+}</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------8B0D3626B05EE637EE2CE4A6--
