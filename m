From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH 0/2]  Add code to release secondary cores from holding
 pen.
Date: Tue, 9 Jun 2015 11:21:28 +0200
Message-ID: <5576B018.9050603@st.com>
References: <1433780219-1245-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433780219-1245-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 06/08/2015 06:16 PM, Peter Griffin wrote:
> I can't test this on a STiH418 platform, as I don't have one, but a similar
> DT change will be required there as well. I'm not sure if u-boot uses
> the same SBC DMEM offset by default or not.
It should have changed.
Could you also patch STiH418 DT to add cpu-release-addr in CPU 2 & 3 nodes?

Thanks,
Maxime
