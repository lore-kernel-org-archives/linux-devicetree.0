From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH] of/base: Replace alias if it already exists
Date: Mon, 02 Jun 2014 19:07:01 +0300
Message-ID: <538CA125.7090906@gmail.com>
References: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com> <20140602145959.7E669C426F6@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140602145959.7E669C426F6@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On  2.06.2014 17:59, Grant Likely wrote:
> On Sun,  1 Jun 2014 15:01:23 +0300, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> wrote:
>> The current code unconditionally adds aliases without check if it already
>> exists, so it is not possible to alter an alias, from board DT file for
>> example. Fix that by replacing an alias if it already exists
>>
>
> Can you describe a more detailed use-case for altering an alias?
>
> g.
>

That one http://www.spinics.net/lists/linux-omap/msg107869.html

Ivo
