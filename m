From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH 04/12] ARM: dts: dragonboard-600c: add board support with serial
Date: Thu, 24 Mar 2016 21:50:03 +0100
Message-ID: <CAP71WjwPqQn-CYtgvRZp8+wq7zPpJ=4Ao+OjUCFiN4Tz35fPXg@mail.gmail.com>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762442-9492-1-git-send-email-srinivas.kandagatla@linaro.org>
 <56F2F78E.8050002@codeaurora.org> <56F2FCD0.1000708@linaro.org>
 <CAOCOHw7TyzDf4jvAMChOFFEgsL4Z1+CcESLOuckT=Q7W9hQvCw@mail.gmail.com> <56F3477E.8090205@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56F3477E.8090205@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 2:48 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> I don't make up the names, but for other qcom sbc products the
> bootloader is looking for sbc there to make sure it picks the right dtb
> blob. So I guess this is _the_ qcom 8064 sbc? Definitely not _the_ 8064
> sbc though.
>
> If this device won't get those bootloaders that look for this then it
> doesn't really matter and I don't care what this is named. Please take a
> look at Documentation/devicetree/bindings/arm/qcom.txt for what I'm
> talking about though.


I would really want to get rid of the 'i need to append the DTB' on
this board. the DT support in the bootloader have been backported , I
am really hoping we can use this DT aware LK, and thus rely on the
compatible string, like we do on db410c. So this is important to get
the name/property right, since we will get there. In fact, I am even
hoping that once we publish this DT aware LK along with this board,
the other myriad of 8064 based 'SBC' from various vendors will upgrade
their bootloader, so that we can have a single 'boot' image (generated
with the help of dtbTool) that works across all devices.
