From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [Patch v2 4/4] tty: serial: msm: Remove direct access to GSBI
Date: Thu, 29 May 2014 11:05:06 -0500
Message-ID: <5A73A2BD-6113-4BC0-860F-BBE6A8232585@codeaurora.org>
References: <1398357082-5102-1-git-send-email-agross@codeaurora.org> <1398357082-5102-5-git-send-email-agross@codeaurora.org> <A56B810D-869A-4E4F-BC29-C9B0F6CDCE79@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <A56B810D-869A-4E4F-BC29-C9B0F6CDCE79@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>
List-Id: devicetree@vger.kernel.org


On May 29, 2014, at 10:14 AM, Kumar Gala <galak@codeaurora.org> wrote:

>=20
> On Apr 24, 2014, at 11:31 AM, Andy Gross <agross@codeaurora.org> wrot=
e:
>=20
>> This patch removes direct access of the GSBI registers.  GSBI config=
uration
>> should be done through the GSBI driver directly.
>>=20
>> Signed-off-by: Andy Gross <agross@codeaurora.org>
>> ---
>> drivers/tty/serial/msm_serial.c |   48 ++---------------------------=
----------
>> drivers/tty/serial/msm_serial.h |    5 ----
>> 2 files changed, 2 insertions(+), 51 deletions(-)
>=20
> Greg,
>=20
> Any update on pulling this is for next?
>=20
> - k

I=92ll send it via arm-soc as the related patches are going via that pa=
th.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
