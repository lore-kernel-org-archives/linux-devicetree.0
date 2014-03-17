From: =?UTF-8?B?44Kr44Kq44CA44Of44Oz44CA44OS44Kn44OD44OX?=
	<cm-hiep@jinso.co.jp>
Subject: Re: [RFC] spi: Using Trigger number to transmit/receive data
Date: Mon, 17 Mar 2014 10:16:03 +0900
Message-ID: <53264CD3.2040205@jinso.co.jp>
References: <1394699364-5669-1-git-send-email-cm-hiep@jinso.co.jp> <20140313141722.GY366@sirena.org.uk>
Reply-To: cm-hiep@jinso.co.jp
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20140313141722.GY366@sirena.org.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, kuninori.morimoto.gx@renesas.com, geert+renesas@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On 03/13/2014 11:17 PM, Mark Brown wrote:
> On Thu, Mar 13, 2014 at 05:29:23PM +0900, Cao Minh Hiep wrote:
>> From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
>>
>> Hi,
>>
>> This is the patch of QSPI that support for r8a7790 SOC. The pupose of
>> this patch is to transmit and receive the 32 bytes of data when the data
>> already has prepared on Transmit/Receive Buffer. Using Transmit/Receive
>> Buffer Data Trigger Number to do that instead transmits/receives a byte
>> of data. With this patch will improve the speed of transfer data.
> Please don't send cover letters for single patches, if there's anything
> that needs to be said put it in the changelog or after the --- in the
> patch.  That way important information won't get lost from history.
Thanks, I will do so in next time.
